Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E46AA12E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Mar 2023 22:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977D510E766;
	Fri,  3 Mar 2023 21:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C4510E765;
 Fri,  3 Mar 2023 21:29:56 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LC2Kk037241; Fri, 3 Mar 2023 21:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4tKpQjyCVxm+zcaOQlBgWVbXx35RnrGGSZPi8xunkKg=;
 b=FTD29dE259v+nhX1gsjASQWLdD3tYD8egwA86tMCsG8W1flKrHkpQ+NJvg6JRaym9EGG
 90rW8+F9C2tnurAR5D6zFNysI8koHNuEVzPwuZsRGd8D11qRYVTG9D/THd7gEeL4hsma
 4z8XhM1YBsA25VJHREidIKfbbJ8/Ftiwc7Ts9SBbDpXThA7RUEiVOT/is5wRWth+876W
 PBKu/wEcKz141hF0eee738VaydyJ73EnB7z2j0JKy7qLOHkIdPRsnARV8FqskG7MVP85
 2ux/qwlDgHTp0zNRxHskOR3QoNwSv3fkps4Tg8Q8cvtnq8iaLfexbvw8sJISEzpuRCj2 gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3rke0da9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 21:29:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 323LIibY017284;
 Fri, 3 Mar 2023 21:29:43 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3rke0d9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 21:29:42 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 323JFCPE005621;
 Fri, 3 Mar 2023 21:29:41 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nybexxeyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 21:29:41 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 323LTd3t55050582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Mar 2023 21:29:40 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB1245805E;
 Fri,  3 Mar 2023 21:29:39 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 160355805B;
 Fri,  3 Mar 2023 21:29:37 +0000 (GMT)
Received: from [9.65.215.88] (unknown [9.65.215.88])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  3 Mar 2023 21:29:36 +0000 (GMT)
Message-ID: <9f06b141-223d-710b-b8b2-6f57b2afb02e@linux.ibm.com>
Date: Fri, 3 Mar 2023 16:29:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/19] Add vfio_device cdev for iommufd support
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, "Xu, Terrence" <terrence.xu@intel.com>
References: <20230227111135.61728-1-yi.l.liu@intel.com>
 <Y/0Cr/tcNCzzIAhi@nvidia.com>
 <DS0PR11MB7529A422D4361B39CCA3D248C3AC9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <SA1PR11MB5873479F73CFBAA170717624F0AC9@SA1PR11MB5873.namprd11.prod.outlook.com>
 <Y/64ejbhMiV77uUA@Asurada-Nvidia>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <Y/64ejbhMiV77uUA@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ily9JCOrlmUQ7iG8vpjaLOjC_EaASRyy
X-Proofpoint-ORIG-GUID: e69JxHb8q15QE4ojBx5smmhbMjMu2hDX
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030178
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/28/23 9:29 PM, Nicolin Chen wrote:
> On Tue, Feb 28, 2023 at 04:58:06PM +0000, Xu, Terrence wrote:
> 
>> Verified this series by "Intel GVT-g GPU device mediated passthrough" and "Intel GVT-d GPU device direct passthrough" technologies.
>> Both passed VFIO legacy mode / compat mode / cdev mode, including negative tests.
>>
>> Tested-by: Terrence Xu <terrence.xu@intel.com>
> 
> Sanity-tested this series on ARM64 with my wip branch:
> https://github.com/nicolinc/iommufd/commits/wip/iommufd-v6.2-nesting
> (Covering new iommufd and vfio-compat)
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Tested a few different flavors of this series on s390 (I grabbed the most recent v6 copy from github):

legacy (IOMMUFD=n): vfio-pci, vfio-ccw, vfio-ap
compat (CONFIG_IOMMUFD_VFIO_CONTAINER=y): vfio-pci, vfio-ccw, vfio-ap
compat+cdev+group (VFIO_DEVICE_CDEV=y && VFIO_GROUP=y): vfio-pci (over cdev using Yi's qemu branch as well as via group), vfio-ccw and vfio-ap via group
compat+cdev-only (VFIO_DEVICE_CDEV=y && VFIO_GROUP=n): vfio-pci using Yi's qemu branch

Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>
