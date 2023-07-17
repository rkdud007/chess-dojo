export const DotLoading = () => {
  return (
    <div className={`flex justify-center items-center`}>
      <div
        className={`w-6 h-6 rounded-full bg-cream mr-4`}
        style={{
          animation: "dot-loading 0.6s linear infinite alternate",
        }}
      ></div>
      <div
        className={`w-6 h-6 rounded-full bg-cream mr-4`}
        style={{
          animation: "dot-loading 0.6s 0.2s linear infinite alternate",
        }}
      ></div>
      <div
        className={`w-6 h-6 rounded-full bg-cream`}
        style={{
          animation: "dot-loading 0.6s 0.4s linear infinite alternate",
        }}
      ></div>
    </div>
  );
};
