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
