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
	useWindowDimensions,
} from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import {
	NativeRouter
} from 'react-router-native';

// App components
import AppBar from './app-bar';
import Login from './login';
import Landing from './landing';
import AppRoutes from './routes';

const Index = () => {
	const dark = false;
	const logged_in = false;
	const theme = dark ? DarkTheme : DefaultTheme;
	const { height, width } = useWindowDimensions();

	// Learn more: https://bit.ly/CRA-vitals
	// reportWebVitals();

	const styles = StyleSheet.create({
		view: {
			minHeight: height,
			minWidth: width,
			width: width,
			maxWidth: width,
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
					<React.StrictMode>
						<React.Fragment>
							<View style={styles.view}>
								<NativeRouter>
									<AppBar theme={theme} />
									<AppRoutes theme={theme} logged_in={logged_in} />
								</NativeRouter>
							</View>
						</React.Fragment>
					</React.StrictMode>
				</SafeAreaView>
			</SafeAreaProvider>
		</PaperProvider >
	);
}

export default Index;
