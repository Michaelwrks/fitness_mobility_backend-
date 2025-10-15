import React from "react";
import { useForm } from "react-hook-form";
import { API_URL } from "../../constants";
import { UserLogin } from "./Login-Logout";
import { useState } from "react";

function UserRegister({
	CiUser,
	TbLockPassword,
	MdOutlineDriveFileRenameOutline,
	formHandle,
	newUserEmail,
	setNewUserEmail,
	newUserPassword,
	setNewUserPassword,
	confirmNewUserPassword,
	setConfirmNewUserPassword,
}) {
	const [firstName, setFirstName] = useState("");
	const [lastName, setLastName] = useState("");
	const [newUserAge, setNewUserAge] = useState("");

	const validate = () => {
		let result = true;
		if (
			newUserEmail === "" ||
			newUserEmail === null ||
			!newUserEmail.includes("@")
		) {
			result = false;
			alert("Please enter a valid email");
		}
		if (
			newUserPassword === "" ||
			newUserPassword === null ||
			newUserPassword.length < 6
		) {
			result = false;
			alert("Please enter a valid password");
		}
		if (newUserPassword !== confirmNewUserPassword) {
			result = false;
			alert("Passwords do not match");
		}
		return result;
	};

	const fullName = firstName + " " + lastName;

	const railsAttributes = {
		name: fullName,
		email: newUserEmail,
		age: newUserAge,
		password: newUserPassword,
		password_confirmation: confirmNewUserPassword,
	};

	const handleSignUp = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();

		if (validate()) {
			try {
				const response = await fetch(`${API_URL}/sign_up`, {
					method: "POST",
					headers: {
						"Content-Type": "application/json",
					},
					body: JSON.stringify({
						user: railsAttributes,
					}),
				});

				if (response.ok) {
					const data = await response.json();
					console.log("signup successful", data);

					const token = data.user.authentication_token;

					console.log(token);

					localStorage.setItem("user-token", token);
					// setIsLoggedIn(true);
				} else {
					const errorData = await response.json();
					console.error("Signup failed:", errorData);
					alert("Signup failed. Please check your details and try again.");
				}
			} catch (err) {
				console.error("Error:", err);
			}
		}
	};

	return (
		<div className="form-container">
			<h2>Register</h2>
			<form onSubmit={handleSignUp}>
				<div className="form-control">
					<input
						type="text"
						placeholder="Enter your first name"
						value={firstName}
						onChange={(e) => setFirstName(e.target.value)}
					/>
					<MdOutlineDriveFileRenameOutline className="icon user" />
				</div>
				{firstName}
				<div className="form-control">
					<input
						type="text"
						placeholder="Enter your last name"
						value={lastName}
						onChange={(e) => setLastName(e.target.value)}
					/>
					<MdOutlineDriveFileRenameOutline className="icon user" />
				</div>
				<div className="form-control">
					<input
						type="text"
						placeholder="Enter your email"
						value={newUserEmail}
						onChange={(e) => setNewUserEmail(e.target.value)}
					/>
					<CiUser className="icon user" />
				</div>

				<p>{newUserEmail}</p>

				<div className="form-control">
					<input
						type="text"
						placeholder="Enter your age"
						value={newUserAge}
						onChange={(e) => setNewUserAge(e.target.value)}
					/>
					<CiUser className="icon user" />
				</div>

				<div className="form-control">
					<input
						type="text"
						placeholder="Enter your Password"
						value={newUserPassword}
						onChange={(e) => setNewUserPassword(e.target.value)}
					/>
					<TbLockPassword className="icon password" />
				</div>

				<div className="form-control">
					<input
						type="text"
						placeholder="Confirm your Password"
						value={confirmNewUserPassword}
						onChange={(e) => setConfirmNewUserPassword(e.target.value)}
					/>
				</div>
				<button>Register</button>

				<p onClick={() => formHandle("login")}>Already have an account? Sign In</p>
			</form>
		</div>
	);
}
export default UserRegister;
