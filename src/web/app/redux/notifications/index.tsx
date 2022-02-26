import { createSlice } from '@reduxjs/toolkit';

interface Notification {
  id: number;
  title: string;
  content: string;
  read: boolean;
  date: string;
}

interface State {
  open: boolean;
  notifications: Notification[];
  unread: number;
}

const notifications = createSlice({
  name: 'notifications',
  initialState: {
    open: false,
    notifications: [],
    unread: 0,
  } as State,
  reducers: {
    toggle_notifications: (state) => {
      state.open = !state.open;
      return state;
    },
    set_notifications: (state, { payload }) => {
      console.log('set_notifications')
      
      // [START] dummy data
      if (!payload) {
        state.notifications = [
          { id: 1, title: 'Dr Smith', content: 'Dr Smith uploaded a new script for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 2, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 3, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 4, title: 'Dr Smith', content: 'Dr Smith uploaded a new script for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 5, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 6, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 7, title: 'Dr Smith', content: 'Dr Smith uploaded a new script for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 8, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 9, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 10, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 11, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 12, title: 'Dr Smith', content: 'Dr Smith uploaded a new script for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 13, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
          { id: 14, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false, date: 'Sat Feb 26 2022 14:35:24 GMT+1100 (AEDT)' },
        ];
        state.unread = state.notifications.length;
      }
      // [END] dummy data

      if (payload) {
        state.notifications = payload;
        state.unread = 0;
        for (let i = 0; i < payload.length; i++) {
          if (payload[i].read == false) {
            state.unread += 1;
          }
        } 
      }

      return state;
    }
  }
});

export default notifications.reducer;