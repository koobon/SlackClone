import { Injectable } from "../../node_modules/@nestjs/common";
import bcryptjs from '../../node_modules/bcryptjs'
import { Repository } from "typeorm";
import { Users } from "src/entities/Users";
import { InjectRepository } from "@nestjs/typeorm";

@Injectable()
export class AuthService {
    constructor(
        @InjectRepository (Users) private usersRepository: Repository<Users>,
        ) {}

    async validateUser(email: string, password: string){
        const user = await this.usersRepository.findOne({
            where: {email},
            select:['email', 'password', 'nickname'],
        })        
        if(!user){           
            return null;
        }        
        
        const result = await bcryptjs.compareSync(password, user.password);
        console.log(password);
        if(result){
            const {password, ...userWithoutPassword} = user;
            return userWithoutPassword;
        }
        return null;
    }
}