default: plan

generated.tf:
	ruby make_records.rb | tee generated.tf

plan: generated.tf
	terraform plan

apply: generated.tf
	terraform apply
