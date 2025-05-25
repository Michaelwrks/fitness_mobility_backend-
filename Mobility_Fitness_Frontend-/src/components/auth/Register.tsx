import React from "react";

function UserRegister({
	CiUser,
	TbLockPassword,
	MdOutlineDriveFileRenameOutline,
	formHandle,
}) {
	return (
		<div className="form-container">
			<h2>Register</h2>
			<form>
				<div className="form-control">
					<input type="text" placeholder="Enter your first name" />
					<MdOutlineDriveFileRenameOutline className="icon user" />
				</div>
				<div className="form-control">
					<input type="text" placeholder="Enter your last name" />
					<MdOutlineDriveFileRenameOutline className="icon user" />
				</div>
				<div className="form-control">
					<input type="text" placeholder="Enter your email" />
					<CiUser className="icon user" />
				</div>

				<div className="form-control">
					<input type="text" placeholder="Enter your Password" />
					<TbLockPassword className="icon password" />
				</div>

				<div className="form-control">
					<input type="text" placeholder="Confirm your Password" />
				</div>
				<button>Register</button>

				<p onClick={() => formHandle("login")}>Already have an account? Sign In</p>
			</form>
		</div>
	);
}
export default UserRegister;
