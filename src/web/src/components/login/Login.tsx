import React from 'react';
import { Appbar, Surface, Text, useTheme, withTheme, TextInput } from "react-native-paper";
import { StyleSheet, View } from 'react-native';
// import BottomNavigation from '../bottom-nav/BottomNav';

function App() {
	const theme = useTheme();
	const [text, setText] = React.useState("");
	
	return (
		<View style={styles.webpage}>
			<Appbar>
				<Appbar.BackAction></Appbar.BackAction>
				<Appbar.Content titleStyle={{ alignSelf: 'center' }} title="medicamina"></Appbar.Content>
				<Appbar.BackAction style={styles.hidebutton} disabled={true}></Appbar.BackAction>
			</Appbar>
			<View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: theme.colors.background }}>
				<Surface style={styles.surface}>
					<TextInput label="E-mail" value={text} onChangeText={text => setText(text)} ></TextInput>
					<TextInput label="Password" value={text} onChangeText={text => setText(text)} secureTextEntry={true}></TextInput>
				<Text>ut ostenderet mundi amorem, quem ostendit nobis</Text>
			</Surface>
		</View>
			{/* <BottomNavigation /> */ }
		</View >
	);
}

const styles = StyleSheet.create({
	webpage: {
		minHeight: '100vh',
		minWidth: '100vw',
		height: '100vh',
		width: '100vw'
	},
	hidebutton: {
		opacity: 0,
		pointerEvents: 'none'
	},
	surface: {
		width: '600px',
		height: '600px',
		maxWidth: '90%',
		maxHeight: '80%',
		elevation: 12,
		padding: '15px'
	}
});


//

export default withTheme(App);
