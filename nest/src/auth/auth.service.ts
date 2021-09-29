import { Injectable } from '@nestjs/common/decorators';
import bcryptjs from 'bcryptjs';
import { Repository } from 'typeorm';
import { Users } from 'src/entities/Users';
import { InjectRepository } from '@nestjs/typeorm';


@Injectable()
export class AuthService {
    constructor(
        @InjectRepository (Users) private usersRepository: Repository<Users>,
        ) {}

    async validateUser(email: string, password: string){
        const user = await this.usersRepository.findOne({
            where: {email},
            select:['id', 'email', 'password', 'nickname'],
        })
        console.log(user);
        if(!user){           
            return null;
        }        
        
        const result = await bcryptjs.compare(password, user.password);
        console.log(result);
        if(result){
            const {password, ...userWithoutPassword} = user;
            return userWithoutPassword;
        }
        return null;
    }
}