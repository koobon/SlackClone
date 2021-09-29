import { Repository } from 'typeorm';
import { Users } from 'src/entities/Users';
import { AuthService } from './auth.service';
import { Injectable } from '@nestjs/common/decorators';
import { PassportSerializer } from '@nestjs/passport/dist';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class LocalSerializer extends PassportSerializer{
    constructor(
        private readonly authService: AuthService,
        @InjectRepository(Users) private usersRepository: Repository<Users>,
    ){
        super();
    }

    serializeUser(user: Users, done:CallableFunction){      
        console.log('serializeUser', user);
        done(null, user.id);
    }

    async deserializeUser(userId: string, done:CallableFunction){
        return await this.usersRepository.findOneOrFail(
        {
          id: +userId,
        },
        {
          select: ['id', 'email', 'nickname'],
          relations: ['Workspaces'],
        },
     )
     .then((user) => {
         console.log('user', user);
         done(null, user);
     })
     .catch((error) => done(error));
    }
}