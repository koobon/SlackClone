import { Repository } from "typeorm";
import { Users } from "src/entities/Users";
import { AuthService } from "./auth.service";
import { Injectable } from "../../node_modules/@nestjs/common";
import { PassportSerializer } from "../../node_modules/@nestjs/passport";
import { InjectRepository } from "@nestjs/typeorm";

@Injectable()
export class LocalSerializer extends PassportSerializer{
    constructor(
        private readonly authService: AuthService,
        @InjectRepository(Users) private userRepository: Repository<Users>,
    ){
        super();
    }

    serializeUser(user: Users, done:CallableFunction){
        done(null, user.id);
    }

    async deserializeUser(userId: string, done:CallableFunction){
        return await this.userRepository.findOneOrFail({
            id:+userId,
        },
            {
                select:['id', 'email', 'nickname'],
                relations:['Workspaces'],            
        },
     )
     .then((user) => {
         console.log('user', user);
         done(null, user);
     })
     .catch((error) => done(error));
    }
}