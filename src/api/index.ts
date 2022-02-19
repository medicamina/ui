import express, {
	Application,
	Request,
	Response,
	NextFunction,
	urlencoded,
	json
} from 'express';
import { Server } from 'http';
import cors from 'cors';
// import { CONFIG } from '../secure/config';
import { decodeJWT } from './auth/jwt';
// import { join } from 'path';
// import { graphqlHTTP } from 'express-graphql';
import { Sequelize } from 'sequelize';

const app: Application = express();
app.use(urlencoded({ extended: true }));
app.use(json());
app.set('trust proxy', true);
app.disable('x-powered-by');
app.use(cors());

const _sequelize = Object.assign(Sequelize);
_sequelize.prototype.constructor = Sequelize;

// const sequelize = new _sequelize({
// 	username: CONFIG.mysql.username,
// 	password: CONFIG.mysql.password,
// 	database: CONFIG.mysql.db,
// 	dialect: 'mysql',
// 	host: CONFIG.mysql.host,
// 	port: CONFIG.mysql.port,
// 	logging: CONFIG.env === "dev" ? console.log : null,
// 	dialectOptions: {
// 		socketPath: CONFIG.mysql.socket,
// 		supportBigNumbers: true,
// 		decimalNumbers: true
// 	}
// });

declare global {
	namespace Express {
		interface Request {
			JWT?: { _id: string; email: string; };
		}
	}
	interface CoreableServer extends Server {
		_done: Promise<Boolean>;
	}
}

app.use(async (req: Request, res: Response, next: NextFunction) => {
	const JWT_TOKEN: string | undefined = req.header("JWT");
	if (JWT_TOKEN) {
		try {
			req.JWT = await decodeJWT(JWT_TOKEN);
			res.setHeader('JWT', JWT_TOKEN);
		} catch (err) {
			delete req.JWT;
			res.removeHeader('JWT');
		}
	}
	next();
});

// app.use('/graphql', graphqlHTTP({
// 	schema: Schema,
// 	pretty: CONFIG.env === 'dev',
// 	graphiql: CONFIG.env === 'dev'
// }));

// (async () => {
// 	switch (CONFIG.env) {
// 		case "pipeline":
// 		case "test":
// 			await sequelize.sync({ force: true });
// 			// await generator();
// 			break;
// 		case "dev":
// 			await sequelize.sync({ force: false });
// 			break;
// 		case "prod":
// 		default:
// 			await sequelize.authenticate();
// 			break;
// 	}
// })();

export { app };