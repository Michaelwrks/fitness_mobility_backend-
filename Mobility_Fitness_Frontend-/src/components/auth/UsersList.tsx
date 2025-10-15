import React, { useState, useEffect } from "react";
import { API_URL } from "../../constants";

function UsersList() {
	const [users, setUsers] = useState<User[]>([]);
	const [, setLoading] = useState(true);
	const [, setError] = useState<string | null>(null);

	type User = {
		id: string;
		attributes: {
			name: string;
			email: string;
			age: number;
		};
	};

	useEffect(() => {
		async function loadUsers() {
			try {
				// Put your API URL here
				const response = await fetch(API_URL, {
					method: "GET",
					headers: {
						// Content-Type header to specify the format of the request
						"Content-Type": "application/json",

						// Caching headers to optimize performance
						"Cache-Control": "no-cache",
						"If-None-Match": "your-etag-here",
					},
				});

				if (response.ok) {
					const json = await response.json();
					console.log(response);
					setUsers(json.data);
				} else {
					throw response;
				}
			} catch (e) {
				if (e instanceof Error) {
					setError(e.message);
				} else {
					throw e;
				}
			} finally {
				setLoading(false);
			}
		}
		loadUsers();
	}, []);

	return (
		<div>
			{users.map((user) => (
				<div key={user.id} className="post-container">
					<h2>{user.attributes.name}</h2>
					<h2>{user.attributes.email}</h2>
					<h2>{user.attributes.age}</h2>
				</div>
			))}
		</div>
	);
}

export default UsersList;
