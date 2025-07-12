import React, {
	useState,
	useEffect,
	HtmlHTMLAttributes,
	ButtonHTMLAttributes,
} from "react";


// import { UsersList } from "../UsersList";
import { API_URL } from "../../constants";
import { notEqual } from "assert";




function UserLogin({ CiUser, TbLockPassword, formHandle, email, setEmail, password, setPassword }) {

	const [isLoggedIn, setIsLoggedIn] = useState(false);

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

					const token = data.user.authentication_token;

					console.log(token);

					localStorage.setItem("user-token", token);
					setIsLoggedIn(true);
				} else {
					console.error("Login failed");
				}
			} catch (err) {
				console.error("Error:", err);
			}
		}
	};

	const handleLogout = async (e) => {
		e.preventDefault();

		{
			try {
				const token = localStorage.getItem("user-token");

				if (!token) {
					console.error("No user token found — user may not be logged in.");
					return;
				}

				const response = await fetch(`${API_URL}/logout`, {
					method: "DELETE",
					headers: {
						"Content-Type": "application/json",
						"X-User-email": email,
						"X-User-Token":  token,
					},
				});
				if (response.ok) {
					const data = await response.json();

					console.log("Logout successful", data);
					localStorage.removeItem("user-token");
					setIsLoggedIn(false);
				} else {
					console.error("Logout failed");
				}
			} catch (err) {
				console.error("Error:", err);
			}
		}
		return handleLogout;
	};

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
						onChange={(e) => setPassword(e.target.value)}
					/>
					<TbLockPassword className="icon password" />
				</div>
				{isLoggedIn ? (
					<button onClick={handleLogout}>Sign out</button>
				) : (
					<button>Sign in</button>
				)}
				<p onClick={() => formHandle("register")}>Dont have an account? Sign up</p>
			</form>
			<p>{email}</p>


		</div>
	);
}
export default UserLogin;
