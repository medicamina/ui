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
// import reportWebVitals from './reportWebVitals';

const Index = () => {
	const dark = true;
	const theme = dark ? DarkTheme : DefaultTheme;
	const { height } = useWindowDimensions();

	// Learn more: https://bit.ly/CRA-vitals
	// reportWebVitals();

	const styles = StyleSheet.create({
		view: {
			minHeight: height,
			backgroundColor: theme.colors.background
		},
		safe: {
			backgroundColor: dark ? 'rgb(39, 39, 39)' : theme.colors.primary
		}
	});

	return (
		<PaperProvider>
			{dark ? (<StatusBar barStyle='light-content' />) : null }
			<SafeAreaView style={styles.safe}>
				<React.StrictMode>
					<React.Fragment>
						<View style={styles.view}>
							<AppBar theme={theme} />
							<Login theme={theme} />
						</View>
					</React.Fragment>
				</React.StrictMode>
			</SafeAreaView>
		</PaperProvider>
	);
}

export default Index;
