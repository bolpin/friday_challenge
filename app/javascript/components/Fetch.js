import React, { useState, useEffect } from "react";

// The useFetch HOOK:
function useFetch(uri) {
  const [data, setData] = useState();
  const [error, setError] = useState();
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!uri) return;
    fetch(uri)
      .then(data => data.json())
      .then(setData)
      .then(() => setLoading(false))
      .catch(setError);
  }, [uri]);

  return {
    loading,
    data,
    error
  };
}

// The Fetch Component:
export default function Fetch({
  uri,
  renderSuccess,
  loadingFallback = <p>loading...</p>,
  renderError = error => <pre>{JSON.stringify(error, null, 2)}</pre>
}) {
  const { loading, data, error } = useFetch(uri);
  if (loading) return loadingFallback;
  if (error) return renderError(error);
  if (data) return renderSuccess({ data });
}

// Example Usage:
// function GitHubUser({ login }) {
//   return (
//     <Fetch
//       uri={`https://api.github.com/users/${login}`}
//       loadingFallback={<LoadingSpinner />}
//       renderError={ error => {
//        return <p> Something went wrong </p>
//        }}
//       renderSuccess={UserDetails}
//     />
//   );
// }
//
// function UserDetails({ data }) {
//   return (
//     <div className="githubUser">
//       <img src={data.avatar_url} alt={data.login} style={{ width: 200 }} />
//       <div>
//         <h1>{data.login}</h1>
//         {data.name && <p>{data.name}</p>}
//         {data.location && <p>{data.location}</p>}
//       </div>
//       <UserRepositories
//         login={data.login}
//         onSelect={(repoName) => console.log(`${repoName} selected`)}
//       />
//     </div>
//   );
// }


