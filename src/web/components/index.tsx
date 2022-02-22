import React from 'react';
import {
	Provider as PaperProvider,
	DarkTheme,
	DefaultTheme
} from 'react-native-paper';
import {
	StyleSheet,
	SafeAreaView,
	StatusBar,
	View,
	useWindowDimensions
} from 'react-native';

import Login from './login';
import AppBar from './app-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
// import reportWebVitals from './reportWebVitals';

const Index = () => {
	const dark = true;
	const theme = dark ? DarkTheme : DefaultTheme;
	const { height, width } = useWindowDimensions();

	// Learn more: https://bit.ly/CRA-vitals
	// reportWebVitals();

	const styles = StyleSheet.create({
		view: {
			minHeight: height,
			minWidth: width,
			backgroundColor: theme.colors.background
		},
		safe: {
			backgroundColor: dark ? 'rgb(39, 39, 39)' : theme.colors.primary
		}
	});

	return (
		<PaperProvider>
			{dark ? (<StatusBar barStyle='light-content' />) : null}
			<SafeAreaProvider>
				<SafeAreaView style={styles.safe}>
					{/* <React.StrictMode> */}
						<React.Fragment>
							<View style={styles.view}>
								<AppBar theme={theme} />
								<Login theme={theme} />
							</View>
						</React.Fragment>
					{/* </React.StrictMode> */}
				</SafeAreaView>
			</SafeAreaProvider>
		</PaperProvider>
	);
}

export default Index;
