import React from 'react';
import {
	Appbar,
	Button
} from "react-native-paper";
import './App.css';
import { StyleSheet } from 'react-native';

function App() {
	return (
		<div style={divStyle}>
			<Appbar style={{}}>
				<Appbar.Content titleStyle={{ alignSelf: 'center' }} title="medicamina"></Appbar.Content>
			</Appbar>
			
			<Button mode="contained" onPress={() => alert("Hello") }>

			</Button>
		</div>
	);
}

const divStyle = StyleSheet.create({
	// minHeight: '100vh'
});

export default App;
