export const truncate = (_address) => {
  const prefixLength = 6;
  const suffixLength = 4;

  if (_address.length <= prefixLength + suffixLength) {
    return _address;
  }

  const prefix = _address.slice(0, prefixLength);
  const suffix = _address.slice(-suffixLength);

  return `${prefix}...${suffix}`;
};
