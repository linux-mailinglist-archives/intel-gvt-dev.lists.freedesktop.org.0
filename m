Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891268302F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 31 Jan 2023 16:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781310E368;
	Tue, 31 Jan 2023 15:00:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6A10E367;
 Tue, 31 Jan 2023 15:00:31 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VDFF6s021574; Tue, 31 Jan 2023 15:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GsZDePIKG25HyslADhmg9uJbyCtJB08Hd41ZfNmglic=;
 b=Kq/6JSJ3t1lUZCp1PnvAi/A2/Sk17IeVzSoPDjvRLDp5cLy3M5ENhyez4zbO96gVYRqW
 ahWwFlDCoacoMnb/I9tnSEbAhfBHkuUI+f+Ro0QohjYJcOsRPEF9D0XO3MNFtxRhCrEZ
 nXI9a7sEgOP6WnbTwozOndIdz5oi+QYKgis/HgxxJyIJZRwZ9W0zP5icctPbKkKEwY/w
 cjb7VZ80Gh45kTGqR57zexsmz/YNLO/H/gdMuhkIEEgL6ttGOdfqArL7iEJTQ9CUepmB
 lyg1OzwUjiTAZN3nmOT/rHSt19Ol0JGh5EdvjiGTMGUjbgk6A9otWvjKfdeEAtnwWGHn KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf3q7tqbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 15:00:21 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VECZ4R013224;
 Tue, 31 Jan 2023 15:00:20 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf3q7tqaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 15:00:20 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDkuJL025829;
 Tue, 31 Jan 2023 15:00:19 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ncvtrmppa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 15:00:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30VF0H9Q43581870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Jan 2023 15:00:17 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6985B58072;
 Tue, 31 Jan 2023 15:00:17 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC6D458066;
 Tue, 31 Jan 2023 15:00:14 +0000 (GMT)
Received: from [9.160.16.25] (unknown [9.160.16.25])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 31 Jan 2023 15:00:14 +0000 (GMT)
Message-ID: <03ff0663-da37-8907-53ec-15234fd7dcad@linux.ibm.com>
Date: Tue, 31 Jan 2023 10:00:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] kvm/vfio: Fix potential deadlock on vfio group_lock
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Anthony Krowiak <akrowiak@linux.ibm.com>
References: <20230120150528.471752-1-yi.l.liu@intel.com>
 <67ec09bf-cb24-34e3-6ec4-1ae87b0738bd@linux.ibm.com>
 <Y9km+xezgD4ovjDX@nvidia.com>
 <b0ed98f6-3586-3151-47e7-9ec86d6c716d@linux.ibm.com>
 <Y9kqNnJ5ayCQSW9z@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <Y9kqNnJ5ayCQSW9z@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N94DBNAKcV5vawYjBA9qSwP_PVzvv0rW
X-Proofpoint-GUID: 5jbvQzTAcO8Dvp6aKRtEUsfYLIS7D-H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=978 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310131
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
Cc: jjherne@linux.ibm.com, linux-s390@vger.kernel.org, farman@linux.ibm.com,
 Yi Liu <yi.l.liu@intel.com>, frankja@linux.ibm.com, pmorel@linux.ibm.com,
 david@redhat.com, imbrenda@linux.ibm.com, seanjc@google.com,
 intel-gfx@lists.freedesktop.org, cohuck@redhat.com, kevin.tian@intel.com,
 zhenyuw@linux.intel.com, linux-kernel@vger.kernel.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, kvm@vger.kernel.org, pbonzini@redhat.com,
 borntraeger@linux.ibm.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/31/23 9:48 AM, Jason Gunthorpe wrote:
> On Tue, Jan 31, 2023 at 09:46:18AM -0500, Anthony Krowiak wrote:
> 
>>> Maybe you should split that lock and have a dedicated apcb lock?
>>
>> I don't think that would suffice for taking the vCPUs out of SIE.
> 
> Then I think we have to keep this patch and also do Matthew's patch to
> keep kvm refs inside vfio as well.
> 

I don't think keeping kvm refs inside vfio solves this issue though -- Even if we handle the kvm_put_kvm asynchronously within vfio as previously proposed, kvm_vfio_release will eventually get called and it gets called with the kvm->lock already held, then proceeds to call vfio_file_set_kvm which gets the group->lock.  That order conflicts with the hierarchy used by the driver during open_device of vfio->group_lock ... kvm->lock. 


