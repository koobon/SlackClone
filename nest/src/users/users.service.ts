import { BadRequestException, HttpException, Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Users } from 'src/entities/Users';
import { Repository } from 'typeorm';
import bcryptjs from 'bcryptjs';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(Users)
    private usersRepository: Repository<Users>,
  ){}

  async join(email: string, nickname: string, password: string) {
    // if(!email){
    //   // 이메일 없는 경우
    //   throw new BadRequestException('이메일을 입력해주세요.'); //400
    // }

    // if(!nickname){
    //   //닉네임이 없는 경우
    //   throw new BadRequestException('닉네임을 입력해주세요.'); //400
    // }

    // if(!password){
    //   //비밀번호 없는 경우
    //   throw new BadRequestException('비밀번호를 입력해주세요.'); //400
    // }

    const user = await this.usersRepository.findOne({where:{email}});
    if(user){
      //이미 존재하는 유저
      throw new UnauthorizedException('이미 가입된 회원입니다.'); //401
    }

    const hashedPassword = await bcryptjs.hash(password, 12);
    await this.usersRepository.save({email, nickname, password:hashedPassword});
  }
}
