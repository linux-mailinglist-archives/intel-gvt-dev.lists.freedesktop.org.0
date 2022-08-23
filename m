Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31459EA85
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Aug 2022 20:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F9810E039;
	Tue, 23 Aug 2022 18:07:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D4510E039
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Aug 2022 18:06:57 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NHiDNo031289;
 Tue, 23 Aug 2022 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nzD+Q/XKWK43KuSFalzO+iSYsQGeOX7EBP+Gzxmo9BU=;
 b=q6cBNRFGNwkVsMB6CfcGreUKRad2SRDl8cyAWfB0jJb8uc3sVGsFHCIneHF+VcbAhUPQ
 HU/BwjeGtYP/kzTn5UtOTQdtJmPIPuu2ERCvPHySykI3Z8wbBCZzKRRafzbGpGAIvKpU
 WLT6hsSqFbn1Fb3JDed6qFJU3dSqTzB99ZuBUJWfeChHsHz/mTYk8XZ3Pq5a+CqbSBlh
 Px1CovC/0/zZZsl7PQJR2a0QxqSmMFcIAg0OxlZp27o6/MYwPON4wcqEM5kBcCBRpSzi
 c1QatQ0iV32VMa1EhStdOYY/ozy3m6P9rqqwRESNOukuz2awv8q7GG5/+9+9Z0CrmvZc 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j53j00rs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 18:06:53 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27NHjhK0004387;
 Tue, 23 Aug 2022 18:06:53 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j53j00rqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 18:06:53 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27NHovOO006477;
 Tue, 23 Aug 2022 18:06:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3j2q8a1mg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 18:06:51 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27NI6oQ78258100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Aug 2022 18:06:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE6BAE064;
 Tue, 23 Aug 2022 18:06:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0852BAE05C;
 Tue, 23 Aug 2022 18:06:50 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.160.161.42]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 23 Aug 2022 18:06:49 +0000 (GMT)
Message-ID: <5455ee86512df43b8a4af388d13317d29e48c205.camel@linux.ibm.com>
Subject: Re: [PATCH 04/14] vfio/mdev: embedd struct mdev_parent in the
 parent data structure
From: Eric Farman <farman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Date: Tue, 23 Aug 2022 14:06:49 -0400
In-Reply-To: <20220822062208.152745-5-hch@lst.de>
References: <20220822062208.152745-1-hch@lst.de>
 <20220822062208.152745-5-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uFyerpvP2nfyX13j81UY3bmu0DSj1qwh
X-Proofpoint-ORIG-GUID: plZgQxlqovgBxjK-6Em5-ugU71XXGCUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208230070
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA4LTIyIGF0IDA4OjIxICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBTaW1wbGlmeSBtZGV2X3t1bn1yZWdpc3Rlcl9kZXZpY2UgYnkgcmVxdWlyaW5nIHRoZSBj
YWxsZXIgdG8gcGFzcyBpbgo+IGEgc3RydWN0dXJlIGFsbG9jYXRlIGFzIHBhcnQgb2YgdGhlIHBh
cmVudCBkZXZpY2Ugc3RydWN0dXJlLsKgIFRoaXMKPiByZW1vdmVzIHRoZSBuZWVkIGZvciBhIGxp
c3Qgb2YgcGFyZW50cyBhbmQgdGhlIHNlcGFyYXRlIG1kZXZfcGFyZW50Cj4gcmVmY291bnQgYXMg
d2UgY2FuIHNpbXBsaWZ5IHJlbHkgb24gdGhlIHJlZmVyZW5jZSB0byB0aGUgcGFyZW50Cj4gZGV2
aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+IFJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogS2ly
dGkgV2Fua2hlZGUgPGt3YW5raGVkZUBudmlkaWEuY29tPgo+IC0tLQo+IMKgLi4uL2RyaXZlci1h
cGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0wqDCoMKgwqDCoMKgIHzCoCAxMiArLQo+IMKgRG9j
dW1lbnRhdGlvbi9zMzkwL3ZmaW8tYXAucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKy0KPiDCoERvY3VtZW50YXRpb24vczM5MC92ZmlvLWNjdy5yc3TCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndnQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNSArLQo+IMKgZHJpdmVycy9zMzkwL2Npby9jaW8uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gwqBkcml2ZXJzL3MzOTAvY2lvL3Zm
aW9fY2N3X2Rydi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICstCj4gwqBk
cml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAxIC0KPiDCoGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfcHJpdmF0ZS5owqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCj4gCj4gCj4gLi4uc25pcC4uLgo+IAo+IC0tLSBhL2Ry
aXZlcnMvczM5MC9jaW8vY2lvLmgKPiArKysgYi9kcml2ZXJzL3MzOTAvY2lvL2Npby5oCj4gQEAg
LTUsNiArNSw3IEBACj4gwqAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiDCoCNpbmNsdWRlIDxs
aW51eC9kZXZpY2UuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KPiDCoCNpbmNsdWRlIDxhc20vY2hwaWQuaD4KPiDCoCNp
bmNsdWRlIDxhc20vY2lvLmg+Cj4gwqAjaW5jbHVkZSA8YXNtL2ZjeC5oPgoKU2luY2UgdGhlIG1k
ZXZfdHlwZS9tZGV2X3BhcmVudCBzdHVmZiBpc24ndCBpbiBzdHJ1Y3Qgc3ViY2hhbm5lbCwgdGhp
cwpzaG91bGQgYmUgaW4gdmZpb19jY3dfcHJpdmF0ZS5oIGluc3RlYWQuCgpUaGFua3MsCkVyaWMK


