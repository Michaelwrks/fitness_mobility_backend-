import { useState } from "react";
import UserLogin from "./components/auth/Login-Logout";
import "./App.css";
// import Home from "./pages/Home";
import { CiUser } from "react-icons/ci";
import { TbLockPassword } from "react-icons/tb";
import { MdOutlineDriveFileRenameOutline } from "react-icons/md";
import "./index.css";
import userSignup from "./components/auth/Register";
import UserRegister from "./components/auth/Register";

function App() {
	const [isNewUser, setIsNewUser] = useState("login");
	const [email, setEmail] = useState("");
	const [password, setPassword] = useState("");
	const [newUserEmail, setNewUserEmail] = useState("");
	const [newUserPassword, setNewUserPassword] = useState("");
	const [confirmNewUserPassword, setConfirmNewUserPassword] = useState("");

	return (
		<>
			<h1>Mobility Prof</h1>

			{isNewUser === "login" ? (
				<UserLogin
					CiUser={CiUser}
					TbLockPassword={TbLockPassword}
					formHandle={setIsNewUser}
					email={email}
					setEmail={setEmail}
					password={password}
					setPassword={setPassword}
				/>
			) : (
				<UserRegister
					CiUser={CiUser}
					TbLockPassword={TbLockPassword}
					MdOutlineDriveFileRenameOutline={MdOutlineDriveFileRenameOutline}
					formHandle={setIsNewUser}
					newUserEmail={newUserEmail}
					setNewUserEmail={setNewUserEmail}
					newUserPassword={newUserPassword}
					setNewUserPassword={setNewUserPassword}
					confirmNewUserPassword={confirmNewUserPassword}
					setConfirmNewUserPassword={setConfirmNewUserPassword}
				/>
			)}

			{/* <UsersList /> */}
		</>
	);
}

export default App;
