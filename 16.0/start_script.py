#!/bin/python

env['ir.config_parameter'].set_param('web.base.url', 'http://localhost:8069')
env['ir.config_parameter'].set_param('web.base.url.freeze', 'True')
env['ir.config_parameter'].set_param('ir_attachment.location', 's3')
env.cr.commit()
