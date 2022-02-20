import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/login/Login';
import reportWebVitals from './reportWebVitals';
import {
	Provider as PaperProvider,
	DarkTheme,
	DefaultTheme
} from 'react-native-paper';
import { Platform } from 'react-native';

const dark = true;

ReactDOM.render(
	<React.StrictMode>
		<React.Fragment>
			<PaperProvider theme={dark ? DarkTheme : DefaultTheme}>
				{Platform.OS === 'web' ? (
					<style type="text/css">{`
        		@font-face {
          		font-family: 'MaterialCommunityIcons';
          		src: url(${require('react-native-vector-icons/Fonts/MaterialCommunityIcons.ttf')}) format('truetype');
        		}
      		`}</style>
				) : null}
				<App />
			</PaperProvider>
		</React.Fragment>
	</React.StrictMode>,
	document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
