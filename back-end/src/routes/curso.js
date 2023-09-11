import { Router } from 'express'
import controller from '../controllers/curso.js'

const router = Router ()

router.post('/', controller.create)

export default router

