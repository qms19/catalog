output: {
	{
		"resource": {
			"alicloud_oss_bucket": {
				"bucket-acl": {
					"bucket": "${var.bucket}"
					"acl":    "private"
				}
			}
		}
		"output": {
			"BUCKET_NAME": {
				"value": "${alicloud_oss_bucket.bucket-acl.bucket}.${alicloud_oss_bucket.bucket-acl.extranet_endpoint}"
			}
		}
		"variable": {
			"bucket": {
				"default": parameter.bucket
			}
		}
	}
}

parameter: {
	bucket: string
}
