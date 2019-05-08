Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F619831
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 07:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA089A77;
	Fri, 10 May 2019 05:54:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C71892F1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 06:45:57 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x496c3WC064136
 for <intel-gvt-dev@lists.freedesktop.org>; Thu, 9 May 2019 02:45:56 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2scc0mf8m2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <intel-gvt-dev@lists.freedesktop.org>; Thu, 09 May 2019 02:45:55 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <intel-gvt-dev@lists.freedesktop.org> from <fiuczy@linux.ibm.com>;
 Thu, 9 May 2019 07:45:53 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 07:45:45 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x496jhIf55050456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 06:45:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F056A4065;
 Thu,  9 May 2019 06:45:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 534D2A4054;
 Thu,  9 May 2019 06:45:42 +0000 (GMT)
Received: from [10.0.2.15] (unknown [9.152.222.56])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 May 2019 06:45:42 +0000 (GMT)
Subject: Re: [libvirt] [PATCH v2 1/2] vfio/mdev: add version attribute for
 mdev device
To: Alex Williamson <alex.williamson@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>
References: <20190506014514.3555-1-yan.y.zhao@intel.com>
 <20190506014904.3621-1-yan.y.zhao@intel.com>
 <20190507151826.502be009@x1.home> <20190508112740.GA24397@joy-OptiPlex-7040>
 <20190508152242.4b54a5e7@x1.home>
From: Boris Fiuczynski <fiuczy@linux.ibm.com>
Date: Wed, 8 May 2019 17:27:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508152242.4b54a5e7@x1.home>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050906-0008-0000-0000-000002E4CB1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050906-0009-0000-0000-000022514FBA
Message-Id: <5eac912c-e753-b5f6-83a4-b646f991d858@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090043
X-Mailman-Approved-At: Fri, 10 May 2019 05:54:27 +0000
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gNS84LzE5IDExOjIyIFBNLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4+PiBJIHRob3VnaHQg
dGhlcmUgd2FzIGEgcmVxdWVzdCB0byBtYWtlIHRoaXMgbW9yZSBzcGVjaWZpYyB0byBtaWdyYXRp
b24KPj4+IGJ5IHJlbmFtaW5nIGl0IHRvIHNvbWV0aGluZyBsaWtlIG1pZ3JhdGlvbl92ZXJzaW9u
LiAgQWxzbywgYXMgYW4KPj4+ICAgCj4+IHNvIHRoaXMgYXR0cmlidXRlIG1heSBub3Qgb25seSBp
bmNsdWRlIGEgbWRldiBkZXZpY2UncyBwYXJlbnQgZGV2aWNlIGluZm8gYW5kCj4+IG1kZXYgdHlw
ZSwgYnV0IGFsc28gaW5jbHVkZSBudW1lcmljIHNvZnR3YXJlIHZlcnNpb24gb2YgdmVuZG9yIHNw
ZWNpZmljCj4+IG1pZ3JhdGlvbiBjb2RlLCByaWdodD8KPiBJdCdzIGEgdmVuZG9yIGRlZmluZWQg
c3RyaW5nLCBpdCBzaG91bGQgYmUgY29uc2lkZXJlZCBvcGFxdWUgdG8gdGhlCj4gdXNlciwgdGhl
IHZlbmRvciBjYW4gaW5jbHVkZSB3aGF0ZXZlciB0aGV5IGZlZWwgaXMgcmVsZXZhbnQuCj4gCldv
dWxkIGEgdmVuZG9yIGFsc28gYmUgYWxsb3dlZCB0byBwcm92aWRlIGEgc3RyaW5nIGV4cHJlc3Np
bmcgcmVxdWlyZWQgCmZlYXR1cmVzIGFzIHdlbGwgYXMgY29udGFpbmluZyBiYWNrZW5kIHJlc291
cmNlIHJlcXVpcmVtZW50cyB3aGljaCBuZWVkIAp0byBiZSBjb21wYXRpYmxlIGZvciBhIHN1Y2Nl
c3NmdWwgbWlncmF0aW9uPyBTb21laG93IGEgYml0IGxpa2UgYSBjcHUgCm1vZGVsLi4uIG1heWJl
IGV2ZW4gYXMganNvbiBvciB4bWwuLi4KSSBhbSBhc2tpbmcgdGhpcyB3aXRoIHZmaW8tYXAgaW4g
bWluZC4gSW4gdGhhdCBjb250ZXh0IGNoZWNraW5nIApjb21wYXRpYmlsaXR5IG9mIHR3byB2Zmlv
LWFwIG1kZXYgZGV2aWNlcyBpcyBub3QgYXMgc2ltcGxlIGFzIGNoZWNraW5nIAppZiB2ZXJzaW9u
IEEgaXMgc21hbGxlciBvciBlcXVhbCB0byB2ZXJzaW9uIEIuCgotLSAKTWl0IGZyZXVuZGxpY2hl
biBHcsO8w59lbi9LaW5kIHJlZ2FyZHMKICAgIEJvcmlzIEZpdWN6eW5za2kKCklCTSBEZXV0c2No
bGFuZCBSZXNlYXJjaCAmIERldmVsb3BtZW50IEdtYkgKVm9yc2l0emVuZGVyIGRlcyBBdWZzaWNo
dHNyYXRzOiBNYXR0aGlhcyBIYXJ0bWFubgpHZXNjaMOkZnRzZsO8aHJ1bmc6IERpcmsgV2l0dGtv
cHAKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBCw7ZibGluZ2VuClJlZ2lzdGVyZ2VyaWNodDogQW10
c2dlcmljaHQgU3R1dHRnYXJ0LCBIUkIgMjQzMjk0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
