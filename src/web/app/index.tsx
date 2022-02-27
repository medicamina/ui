import React from 'react';
import {
	Provider as PaperProvider,
	DarkTheme,
	DefaultTheme
} from 'react-native-paper';
import {
	StyleSheet,
	StatusBar,
	View,
	useWindowDimensions,
} from 'react-native';
import {
	NativeRouter
} from 'react-router-native';
import { 
	SafeAreaProvider, 
	initialWindowMetrics, 
	SafeAreaView 
} from 'react-native-safe-area-context';
import { Provider } from 'react-redux'
import redux from './redux';

// App components
import AppBar from './views/app-bar';
import AppRoutes from './routes';

const Index = () => {
	const dark = false;
	const logged_in = true;
	const theme = dark ? DarkTheme : DefaultTheme;
	const { height, width } = useWindowDimensions();

	// Learn more: https://bit.ly/CRA-vitals
	// reportWebVitals();

	const styles = StyleSheet.create({
		view: {
			minHeight: height,
			maxWidth: width,
			backgroundColor: theme.colors.background
		},
		safe: {
			flex: 1,
			backgroundColor: dark ? 'rgb(39, 39, 39)' : theme.colors.primary
		}
	});

	return (
		<SafeAreaProvider initialMetrics={initialWindowMetrics}>
			<SafeAreaView style={styles.safe}>
				{dark ? (<StatusBar barStyle='light-content' />) : null}
				{/* <React.StrictMode> */}
				<PaperProvider>
					<Provider store={redux}>
						<View style={styles.view}>
							<NativeRouter>
								<AppBar theme={theme} logged_in={logged_in} />
								<AppRoutes theme={theme} logged_in={logged_in} />
							</NativeRouter>
						</View>
					</Provider>
				</PaperProvider>
				{/* </React.StrictMode> */}
			</SafeAreaView>
		</SafeAreaProvider>
	);
}

export default Index;
