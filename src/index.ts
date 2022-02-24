import { join } from 'path';
import { app } from './api';
import { CONFIG } from './api/secure/config';
import { static as expressStatic } from 'express';
import { createServer } from 'http';

app.use(expressStatic(join(__dirname + '/public'), { index: 'index.html' } ));

const server: CoreableServer = createServer(app) as CoreableServer;

server.listen(CONFIG.port, () => {
	console.log("\n", "\x1b[31m", `http://localhost:${CONFIG.port}/`, "\x1b[37m", "\n");
});