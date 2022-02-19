import React from 'react';
import { Button } from "@react-native-material/core";
import logo from './logo.svg';
import './App.css';

function App() {
	return (
		<Button title="Click Me" onPress={() => alert("🎉🎉🎉")} />
	);
}

export default App;
