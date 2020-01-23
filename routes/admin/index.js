const init = db => {

	const categories = require('./categories')(db)
	// const products = require('./products')

	const router = require('express').Router()

	// autorização
	/*
	router.use((req, res, next) => {
		if (req.session.user) {
			if (req.session.user.roles.indexOf('admin') < 0) {
				res.redirect('/')
			} else {
				next()
			}
		} else {
			res.redirect('/login')
		}
	})
	*/

	router.get('/', (req, res) => res.render('admin/index'))
	router.use('/categorias', categories)
	// router.use('/produto', products(db))


	return router
}

module.exports = init
