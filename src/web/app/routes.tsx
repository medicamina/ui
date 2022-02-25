import React from 'react';
import {
  Text
} from 'react-native-paper';
import {
  Routes,
  Route,
  Navigate
} from 'react-router-native';;

// App components
import Login from './views/login';
import Landing from './views/landing';
import Home from './views/home';

const AppRoutes = ({ theme, logged_in }) => {
    return (
      <Routes>
        <Route path='/' element={logged_in ? <Navigate to='/home'/> : <Navigate to='/landing' />} />
        <Route path='/landing' element={<Landing theme={theme} />} />
        <Route path='/login' element={<Login theme={theme} />} />
        <Route path='/home' element={<Home theme={theme} />} />
        <Route element={<Text theme={theme}>There's nothing here!</Text>} />
      </Routes>
    );
}

export default AppRoutes;