/** @type {import('tailwindcss').Config} */
export default {
  // Add these lines to tell Tailwind what files to scan
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}", // This is the most important line
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
