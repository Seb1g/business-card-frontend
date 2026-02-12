import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.scss'
import BusinessPage from './BusinessPage/BusinessPage'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <BusinessPage />
  </StrictMode>,
)
