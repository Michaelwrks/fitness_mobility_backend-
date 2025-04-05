import { useState } from "react";
import { login } from "./components/auth/Login";
import "./App.css";
import Home from "./pages/Home";
import UsersList from "./components/UsersList";

function App() {
	return (
		<>
			<h1>Mobility Prof</h1>
			<UsersList />
		</>
	);
}

export default App;
