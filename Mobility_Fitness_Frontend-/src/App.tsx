import { useState } from "react";
import UserLogin from "./components/auth/Login";
import "./App.css";
import Home from "./pages/Home";
import UsersList from "./components/UsersList";
import { CiUser } from "react-icons/ci";


function App() {
	return (
		<>
			<h1>Mobility Prof</h1>
			<UserLogin CiUser={CiUser}/>
			{/* <UsersList /> */}
		</>
	);
}

export default App;
