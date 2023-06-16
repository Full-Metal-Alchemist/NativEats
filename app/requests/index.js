import axios from 'axios';

export const authAxiosGet = async (url, token, params) => {
  // todo
  const reqConfig = {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  };
  return axios.get(url, reqConfig, params);
};

export const authAxiosPost = async (url, token, params) => {
  // todo
  const reqConfig = {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  };
  return axios.post(url, reqConfig, params);
};

export const authAxiosPatch = async (url, token, params) => {
  // todo
};

export const authAxiosDelete = async (url, token, params) => {
  // todo
};
