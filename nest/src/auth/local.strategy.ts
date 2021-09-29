import { Strategy } from 'passport-local';
import { PassportStrategy } from '@nestjs/passport/dist';
import { Injectable } from '@nestjs/common/decorators';
import { UnauthorizedException } from '@nestjs/common/exceptions';
import { AuthService } from './auth.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(private authService: AuthService) {
    super({ usernameField: 'email', passwordField: 'password' });
  }

  async validate(email: string, password: string, done: CallableFunction) {
    const user = await this.authService.validateUser(email, password);
    console.log('validate user', user);
    if (!user) {
      throw new UnauthorizedException();
    }
    return done(null, user);
  }
}
