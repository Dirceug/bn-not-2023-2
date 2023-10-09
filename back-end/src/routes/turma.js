import { Router } from 'express'
import controller from '../controllers/turma.js'

const router = Router()

router.post('/', controller.create)
router.get('/', controller.retrieveAll)
router.get('/:id', controller.retrieveOne)
router.put('/:id', controller.update)
router.put('.:turmaId/aluno/:alunoId', controller.AddAluno)//Inserido quarta
router.delete('/:id', controller.delete)
router.delete('/:turmaId/aluno/:alunoId', controller.removerAluno)//Inserido quarta

export default router