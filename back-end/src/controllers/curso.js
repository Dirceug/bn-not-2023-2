import prisma from '../Database/client.js'

const controller ={} //Objeto vazio

controller.create = async function(req, res) {
    try {
        //Conecta-se ao BD e envia uma instrução de criação de um novo documento, com os dados que estarão dentro da req.body
        await prisma.curso.create({data: req.doby})
        //Envia uma resposta de sucesso ao front-end
        //HTTP 201 Created
        res.status(201).end()
    }
    catch(error){
        //Deu errado: exibe o erro no console do back-end
        console.error(error)
        //Envia o erro ao front-end
        //HTTP 500: Internal Server Error
        res.status(500).send(error)
    }
}

export default controller