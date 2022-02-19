import React from 'react';
import { Button } from "@react-native-material/core";
import logo from './logo.svg';
import './App.css';

function App() {
	return (
		<div>
			<img src={logo} className="App-logo" alt="logo" />
			<Button title="Click Me" onPress={() => alert("🎉🎉🎉")} />
		</div>
	);
}

export default App;
