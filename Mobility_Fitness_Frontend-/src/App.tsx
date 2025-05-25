import { useState } from "react";
import UserLogin from "./components/auth/Login";
import "./App.css";
// import Home from "./pages/Home";
import { CiUser } from "react-icons/ci";
import { TbLockPassword } from "react-icons/tb";
import { MdOutlineDriveFileRenameOutline } from "react-icons/md";
import UserSignUp from "./components/auth/Register";
import "./index.css"

function App() {
	const [isNewUser, setIsNewUser] = useState("login");

	return (
		<>
			<h1>Mobility Prof</h1>

			{isNewUser === "login" ? (
				<UserLogin
					CiUser={CiUser}
					TbLockPassword={TbLockPassword}
					formHandle={setIsNewUser}
				/>
			) : (
				<UserSignUp
					CiUser={CiUser}
					TbLockPassword={TbLockPassword}
					MdOutlineDriveFileRenameOutline={MdOutlineDriveFileRenameOutline}
					formHandle={setIsNewUser}
				/>
			)}

			{/* <UsersList /> */}
		</>
	);
}

export default App;
