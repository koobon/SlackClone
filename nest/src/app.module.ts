import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LoggerMiddleware } from './middlewares/logger.middlewares';
import { UsersModule } from './users/users.module';
import { WorkspacesModule } from './workspaces/workspaces.module';
import { DmsModule } from './dms/dms.module';
import { ChannelsController } from './channels/channels.controller';
import { ChannelsService } from './channels/channels.service';
import { ChannelsModule } from './channels/channels.module';
import { UsersService } from './users/users.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import {ChannelChats} from './entities/ChannelChats'
import {ChannelMembers} from './entities/ChannelMembers'
import {Channels} from './entities/Channels'
import {DMs} from './entities/DMs'
import {Mentions} from './entities/Mentions'
import {Users} from './entities/Users'
import {WorkspaceMembers} from './entities/WorkspaceMembers'
import {Workspaces} from './entities/Workspaces'
import { AuthModule } from './auth/auth.module';


@Module({
  imports: [
    ConfigModule.forRoot(),
    AuthModule,
    UsersModule,
    WorkspacesModule,
    DmsModule,
    ChannelsModule,
    TypeOrmModule.forFeature([Users, WorkspaceMembers, ChannelMembers]),
    TypeOrmModule.forRoot({
      type:'mysql',
      host:'localhost',
      port:3306,
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
      entities: [ChannelChats, ChannelMembers, Channels, DMs, Mentions, Users, WorkspaceMembers, Workspaces],
      logging: true,      
      keepConnectionAlive: true,
      synchronize: false,
    })
  ],
  controllers: [AppController, ChannelsController],
  providers: [AppService, ChannelsService, UsersService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer): any {
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}
