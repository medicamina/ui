import { createSlice } from '@reduxjs/toolkit';

const notifications = createSlice({
  name: 'notifications',
  initialState: {
    open: false,
    data: []
  },
  reducers: {
    set_read: (state) => {

    },
    open_notifications: (state) => {

    },
    set_notifications: (state, data) => {
      state.data = [
        { id: 1, title: 'Dr Smith', content: 'Dr Smith uploaded a new script for you', read: false },
        { id: 2, title: 'Mrs Apple', content: 'Mrs Apple uploaded new information about your family tree', read: false },
        { id: 3, title: 'Surg. Thomas', content: 'Surg Thomas added a surgery report for you', read: false }
      ];
      return state;
    }
  }
});



export default notifications.reducer;