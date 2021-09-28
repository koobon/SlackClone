import {Strategy} from '../../node_modules/passport-local';
import { PassportStrategy } from '../../node_modules/@nestjs/passport';
import { Injectable, UnauthorizedException } from '../../node_modules/@nestjs/common';
import { AuthService } from './auth.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy){
    constructor(private authService: AuthService){
        super({usernameField:'email', passwordField:'password'});
    }

    async validate(email: string, password: string, done: CallableFunction){
        const user = await this.authService.validateUser(email, password);
        if(!user){
            throw new UnauthorizedException();
        }
        return done(null, user);
    }
}