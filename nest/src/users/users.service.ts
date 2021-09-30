import { BadRequestException, HttpException, Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Users } from 'src/entities/Users';
import { Repository, getConnection, Connection } from 'typeorm';
import bcryptjs from 'bcryptjs';
import { WorkspaceMembers } from 'src/entities/WorkspaceMembers';
import { ChannelMembers } from 'src/entities/ChannelMembers';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(Users)
    private usersRepository: Repository<Users>,
    @InjectRepository(WorkspaceMembers)
    private workspaceMembersRepository : Repository<WorkspaceMembers>,
    @InjectRepository(ChannelMembers)
    private channelMembersRepository : Repository<ChannelMembers>,
    private connection: Connection,
  ){}

  async join(email: string, nickname: string, password: string) {
    const queryRunner = this.connection.createQueryRunner();
    
    await queryRunner.connect();
    await queryRunner.startTransaction();

    const user = await queryRunner.manager.getRepository(Users).findOne({where:{email}});
    if(user){
      //이미 존재하는 유저
      throw new UnauthorizedException('이미 가입된 회원입니다.'); //401
    }
    const hashedPassword = await bcryptjs.hash(password, 12);

    //querryRunner를 사용한 transaction 걸기
    try {
       const returnUser = await queryRunner.manager.getRepository(Users).save(({
         email, 
         nickname, 
         password:hashedPassword,
        }));

       await queryRunner.manager.getRepository(WorkspaceMembers).save({
         UserId: returnUser.id, 
         WorkspaceId : 1,
        });   

       await queryRunner.manager.getRepository(ChannelMembers).save({
         UserId: returnUser.id, 
         ChannelId : 1,
        });
        
       await queryRunner.commitTransaction();
    }catch(error){
      console.error(error);
      await queryRunner.rollbackTransaction();
      throw error;
    }finally{
      await queryRunner.release();
    }
    //사용자 회원 가입
   
    //회원 가입 후 워프스페이스 ID 1번에 회원 가입 한 사용자 추가
    
    //회원 가입 후 채널 1번에 회원 가입 한 사용자 추가
    
    return true;
  }
}
