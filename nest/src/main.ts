import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { ValidationPipe } from '../nest/node_modules/@nestjs/common';
import { AppModule } from './app.module';
import { HttpExceptionFilter } from './httpException.filter';
import passport from './../node_modules/passport';


declare const module: any;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const port = process.env.PORT || 3000;
  app.useGlobalPipes(new ValidationPipe()); //class Validator 사용을 위해(class validator 붙은 DTO 검증까지 다 해줌)
  app.useGlobalFilters(new HttpExceptionFilter);
  const config = new DocumentBuilder()
    .setTitle('SlackClone API')
    .setDescription('SlackClone 개발을 위한 API 문서 입니다.')
    .setVersion('1.0')
    .addCookieAuth('connect.sid')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);  
  app.use(passport.initialize());
  app.use(passport.session());
  await app.listen(port);
  console.log('Listening on port' + '%d', port);

  if (module.hot) {
    module.hot.accept();
    module.hot.dispose(() => app.close());
  }
}
bootstrap();
