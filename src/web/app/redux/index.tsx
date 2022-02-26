import { configureStore } from '@reduxjs/toolkit'
import notifications from './app-bar';

export const store = configureStore({
  reducer: {
    notifications: notifications
  }
});

export type RootState = ReturnType<typeof store.getState>;
export default store;