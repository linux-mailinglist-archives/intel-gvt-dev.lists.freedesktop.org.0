Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B265F878
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Jan 2023 02:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C5B10E2A5;
	Fri,  6 Jan 2023 01:03:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 2811 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 01:03:41 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EFB10E2A5;
 Fri,  6 Jan 2023 01:03:41 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3060xRJs027071; Fri, 6 Jan 2023 01:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H3o6tON5owMSXwvuPyf2voj0PCtiOis55aqH7xs9h+Q=;
 b=qGD9nV9Wwn5xkJP5ZW8DYBQZnIPjLy37H/l+TB+mrQv2bvMvFOyVFoC/BcUSUuVjbMRH
 8pSV2BNyTAus8E+Z608QE70pROq/AZDvpRo34zwiy5fLvzCl+TfWBJPa2C+pJ7NFeKmN
 wYMeCxy6rgh94KDdHK4lqrH0UrhjXkSGpVLf3YZsdbAH/rhW+3caQXGulz61ifux6UDS
 9XgS4Up5n7mgDGyEMyXl0QFN4/D+iGp7vC5shDMCwelaY4KLmSEQpf9u2igWrba0ODte
 m5dQu28/42T7OjJSOHw1xomfFfZiw6GZdd1B9wQ/4C4ftt83YMTfvqoUwRXyxyC2lyb5 cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx9k983hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 01:03:37 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30610808030362;
 Fri, 6 Jan 2023 01:03:37 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx9k983hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 01:03:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305NmnaV020198;
 Fri, 6 Jan 2023 01:03:35 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3mtcq80w9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 01:03:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30613Y4K46334654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Jan 2023 01:03:34 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54CC858064;
 Fri,  6 Jan 2023 01:03:34 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77CA458056;
 Fri,  6 Jan 2023 01:03:32 +0000 (GMT)
Received: from [9.160.126.91] (unknown [9.160.126.91])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  6 Jan 2023 01:03:32 +0000 (GMT)
Message-ID: <d0e55400-d749-23a2-c88f-a2272723bc65@linux.ibm.com>
Date: Thu, 5 Jan 2023 20:03:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/1] vfio: remove VFIO_GROUP_NOTIFY_SET_KVM
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220519183311.582380-1-mjrosato@linux.ibm.com>
 <20220519183311.582380-2-mjrosato@linux.ibm.com>
 <20230105150930.6ee65182.alex.williamson@redhat.com>
 <Y7dehnZSC6ukNxKU@nvidia.com>
 <5e17a35d-2a94-f482-c466-521afcab80b8@linux.ibm.com>
 <Y7dsJpudKGtM0kbl@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <Y7dsJpudKGtM0kbl@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qSA-WQm0cN_f2KPomMfKGbg7bJ0EykJW
X-Proofpoint-ORIG-GUID: K0or9jUZQNxgyJRFdIz7eHqAFs_WqRdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_14,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060006
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, hch@infradead.org,
 linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com, pasic@linux.ibm.com,
 Alex Williamson <alex.williamson@redhat.com>, borntraeger@linux.ibm.com,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/5/23 7:32 PM, Jason Gunthorpe wrote:
> On Thu, Jan 05, 2023 at 07:16:37PM -0500, Matthew Rosato wrote:
> 
>> Yeah, this is also what I was thinking, replace the direct
>> kvm_put_kvm calls with, say, schedule_delayed_work in each driver,
>> where the delayed task just does the kvm_put_kvm (along with a brief
>> comment explaining why we handle the put asynchronously).
> 
> Don't put that in every driver, do something like mmput_async() where
> the core code has all of this.
> 

If the core vfio code were to add logic to invoke kvm_put_kvm and kvm_get_kvm, won't this introduce a vfio dependency on kvm?  If I recall, we have the drivers handling the kvm reference today in order to avoid that..

>> Other than that..  The goal of this patch originally was to get the
>> kvm reference at first open_device and release it with the very last
>> close_device, so the only other option I could think of would be to
>> take the responsibility back from the vfio drivers and do the
>> kvm_get_kvm and kvm_put_kvm directly in vfio_main after dropping the
>> (but that would result in some ugly symbol linkage and would acquire
>> kvm references that a driver maybe does not care about so I don't
>> really like that idea)
> 
> And we still have the deadlock problem anyhow..

Looks like I never finished my sentence here -- I meant call kvm_put_kvm directly in vfio_main after dropping the group lock (e.g. when we set device->kvm = NULL;). But I think we'd still have the kvm dependency issue


