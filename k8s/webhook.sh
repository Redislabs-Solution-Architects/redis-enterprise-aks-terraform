#!/bin/sh

# save cert
CERT=`kubectl get secret admission-tls -o jsonpath='{.data.cert}'`
sed 's/NAMESPACE_OF_SERVICE_ACCOUNT/redisgeek/g' webhook.yaml | kubectl create -f -

# create patch file
cat > modified-webhook.yaml <<EOF
webhooks:
- name: redb.admission.redislabs
  clientConfig:
    caBundle: $CERT
  admissionReviewVersions: ["v1beta1"]
EOF
# patch webhook with caBundle
kubectl patch ValidatingWebhookConfiguration redb-admission --patch "$(cat modified-webhook.yaml)"