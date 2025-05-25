import React, { useState, useEffect } from "react";
// import { UsersList } from "../UsersList";
import { API_URL } from "../../constants";

function UserLogin({ CiUser, TbLockPassword, formHandle }) {
	const [email, setEmail] = useState("");
	const [password, setpassword] = useState("");

	const validate = () => {
		let result = true;
		if (email === "" || email === null || !email.includes("@")) {
			result = false;
			alert("Please enter a valid email");
		}
		if (password === "" || password === null || password.length < 6) {
			result = false;
			alert("Please enter a valid password");
		}
		return result;
	};

	const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
		e.preventDefault();

		const login = { email, password };
		if (validate()) {
			try {
				const response = await fetch(`${API_URL}/login`, {
					method: "POST",
					headers: {
						"Content-Type": "application/json",
					},
					body: JSON.stringify(login),
				});
				if (response.ok) {
					const data = await response.json();
					console.log("Login successful", data);
				} else {
					console.error("Login failed");
				}
			} catch (err) {
				console.error("Error:", err);
			}
		}
	};

	const handleLogout = localStorage.setItem('token')
	return (
		<div className="form-container">
			<h2>Login</h2>
			<form onSubmit={handleLogin}>
				<div className="form-control">
					<input
						type="text"
						required
						value={email}
						placeholder="Enter your email"
						onChange={(e) => setEmail(e.target.value)}
					/>
					<CiUser className="icon user" />
				</div>

				<div className="form-control">
					<input
						type="text"
						value={password}
						placeholder="Enter your password"
						onChange={(e) => setpassword(e.target.value)}
					/>
					<TbLockPassword className="icon password" />
				</div>
				<button>Sign in</button>

				<p onClick={() => formHandle("register")}>Dont have an account? Sign up</p>
			</form>
			<p>{email}</p>
		</div>
	);
}
export default UserLogin;
