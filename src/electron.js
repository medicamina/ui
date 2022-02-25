const path = require('path');
const { app, BrowserWindow, shell } = require('electron');
const isDev = require('electron-is-dev');

function createWindow() {
  // Create the browser window.
  const win = new BrowserWindow({
    webPreferences: {
      nodeIntegration: true
    },
  });

  win.maximize();
  win.show();

  // and load the index.html of the app.
  win.loadURL(isDev ? 'http://localhost:9000/' : '...url to be deteremined');

  // Open the DevTools.
  if (isDev) {
    win.webContents.openDevTools({ mode: 'detach' });
  }

  win.webContents.on('new-window', (...props) => {
    if (props[1].indexOf(props[props.length-2]) <= 0) {
      props[0].preventDefault();
      require('electron').shell.openExternal(props[1]);
    }
  });
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(createWindow);

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});
