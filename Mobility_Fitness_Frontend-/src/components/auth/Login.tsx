import React from "react";

function UserLogin({ CiUser }) {
	return (
		<div className="form-container">
			<h2>Login</h2>
			<form>
				<div className="form-control">
					<input type="text" placeholder="Enter your email or user email" />
					<CiUser />
				</div>

				<div className="form-control">
					<input type="text" placeholder="Enter your emal or user email" />
				</div>
				<button>Sign in</button>

				<p>Dont have an account? Sign up</p>
			</form>
		</div>
	);
}
export default UserLogin;
